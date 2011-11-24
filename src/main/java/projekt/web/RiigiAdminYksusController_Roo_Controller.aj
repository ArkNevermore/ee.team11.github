// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.AdminAlluvus;
import ee.itcollege.team11.RiigiAdminYksus;
import ee.itcollege.team11.RiigiAdminYksuseLiik;
import ee.itcollege.team11.Ruumiyksus;
import ee.itcollege.team11.Vaeosa;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RiigiAdminYksusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String RiigiAdminYksusController.create(@Valid RiigiAdminYksus riigiAdminYksus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("riigiAdminYksus", riigiAdminYksus);
            return "riigiadminyksuses/create";
        }
        uiModel.asMap().clear();
        riigiAdminYksus.persist();
        return "redirect:/riigiadminyksuses/" + encodeUrlPathSegment(riigiAdminYksus.getRiigiAdminYksusId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String RiigiAdminYksusController.createForm(Model uiModel) {
        uiModel.addAttribute("riigiAdminYksus", new RiigiAdminYksus());
        return "riigiadminyksuses/create";
    }
    
    @RequestMapping(value = "/{riigiAdminYksusId}", method = RequestMethod.GET)
    public String RiigiAdminYksusController.show(@PathVariable("riigiAdminYksusId") Long riigiAdminYksusId, Model uiModel) {
        uiModel.addAttribute("riigiadminyksus", RiigiAdminYksus.findRiigiAdminYksus(riigiAdminYksusId));
        uiModel.addAttribute("itemId", riigiAdminYksusId);
        return "riigiadminyksuses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String RiigiAdminYksusController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("riigiadminyksuses", RiigiAdminYksus.findRiigiAdminYksusEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) RiigiAdminYksus.countRiigiAdminYksuses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("riigiadminyksuses", RiigiAdminYksus.findAllRiigiAdminYksuses());
        }
        return "riigiadminyksuses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RiigiAdminYksusController.update(@Valid RiigiAdminYksus riigiAdminYksus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("riigiAdminYksus", riigiAdminYksus);
            return "riigiadminyksuses/update";
        }
        uiModel.asMap().clear();
        riigiAdminYksus.merge();
        return "redirect:/riigiadminyksuses/" + encodeUrlPathSegment(riigiAdminYksus.getRiigiAdminYksusId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{riigiAdminYksusId}", params = "form", method = RequestMethod.GET)
    public String RiigiAdminYksusController.updateForm(@PathVariable("riigiAdminYksusId") Long riigiAdminYksusId, Model uiModel) {
        uiModel.addAttribute("riigiAdminYksus", RiigiAdminYksus.findRiigiAdminYksus(riigiAdminYksusId));
        return "riigiadminyksuses/update";
    }
    
    @RequestMapping(value = "/{riigiAdminYksusId}", method = RequestMethod.DELETE)
    public String RiigiAdminYksusController.delete(@PathVariable("riigiAdminYksusId") Long riigiAdminYksusId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        RiigiAdminYksus.findRiigiAdminYksus(riigiAdminYksusId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/riigiadminyksuses";
    }
    
    @ModelAttribute("adminalluvuses")
    public Collection<AdminAlluvus> RiigiAdminYksusController.populateAdminAlluvuses() {
        return AdminAlluvus.findAllAdminAlluvuses();
    }
    
    @ModelAttribute("riigiadminyksuses")
    public Collection<RiigiAdminYksus> RiigiAdminYksusController.populateRiigiAdminYksuses() {
        return RiigiAdminYksus.findAllRiigiAdminYksuses();
    }
    
    @ModelAttribute("riigiadminyksuseliiks")
    public Collection<RiigiAdminYksuseLiik> RiigiAdminYksusController.populateRiigiAdminYksuseLiiks() {
        return RiigiAdminYksuseLiik.findAllRiigiAdminYksuseLiiks();
    }
    
    @ModelAttribute("ruumiyksuses")
    public Collection<Ruumiyksus> RiigiAdminYksusController.populateRuumiyksuses() {
        return Ruumiyksus.findAllRuumiyksuses();
    }
    
    @ModelAttribute("vaeosas")
    public Collection<Vaeosa> RiigiAdminYksusController.populateVaeosas() {
        return Vaeosa.findAllVaeosas();
    }
    
    String RiigiAdminYksusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
