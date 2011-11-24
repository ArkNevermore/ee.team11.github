// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.AdminAlluvus;
import ee.itcollege.team11.RiigiAdminYksus;
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

privileged aspect AdminAlluvusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String AdminAlluvusController.create(@Valid AdminAlluvus adminAlluvus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("adminAlluvus", adminAlluvus);
            return "adminalluvuses/create";
        }
        uiModel.asMap().clear();
        adminAlluvus.persist();
        return "redirect:/adminalluvuses/" + encodeUrlPathSegment(adminAlluvus.getAdminAlluvusId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String AdminAlluvusController.createForm(Model uiModel) {
        uiModel.addAttribute("adminAlluvus", new AdminAlluvus());
        return "adminalluvuses/create";
    }
    
    @RequestMapping(value = "/{adminAlluvusId}", method = RequestMethod.GET)
    public String AdminAlluvusController.show(@PathVariable("adminAlluvusId") Long adminAlluvusId, Model uiModel) {
        uiModel.addAttribute("adminalluvus", AdminAlluvus.findAdminAlluvus(adminAlluvusId));
        uiModel.addAttribute("itemId", adminAlluvusId);
        return "adminalluvuses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String AdminAlluvusController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("adminalluvuses", AdminAlluvus.findAdminAlluvusEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) AdminAlluvus.countAdminAlluvuses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("adminalluvuses", AdminAlluvus.findAllAdminAlluvuses());
        }
        return "adminalluvuses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AdminAlluvusController.update(@Valid AdminAlluvus adminAlluvus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("adminAlluvus", adminAlluvus);
            return "adminalluvuses/update";
        }
        uiModel.asMap().clear();
        adminAlluvus.merge();
        return "redirect:/adminalluvuses/" + encodeUrlPathSegment(adminAlluvus.getAdminAlluvusId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{adminAlluvusId}", params = "form", method = RequestMethod.GET)
    public String AdminAlluvusController.updateForm(@PathVariable("adminAlluvusId") Long adminAlluvusId, Model uiModel) {
        uiModel.addAttribute("adminAlluvus", AdminAlluvus.findAdminAlluvus(adminAlluvusId));
        return "adminalluvuses/update";
    }
    
    @RequestMapping(value = "/{adminAlluvusId}", method = RequestMethod.DELETE)
    public String AdminAlluvusController.delete(@PathVariable("adminAlluvusId") Long adminAlluvusId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AdminAlluvus.findAdminAlluvus(adminAlluvusId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/adminalluvuses";
    }
    
    @ModelAttribute("adminalluvuses")
    public Collection<AdminAlluvus> AdminAlluvusController.populateAdminAlluvuses() {
        return AdminAlluvus.findAllAdminAlluvuses();
    }
    
    @ModelAttribute("riigiadminyksuses")
    public Collection<RiigiAdminYksus> AdminAlluvusController.populateRiigiAdminYksuses() {
        return RiigiAdminYksus.findAllRiigiAdminYksuses();
    }
    
    String AdminAlluvusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
