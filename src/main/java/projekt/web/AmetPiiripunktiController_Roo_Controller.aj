// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.Amet;
import ee.itcollege.team11.AmetPiiripunkti;
import ee.itcollege.team11.Piiripunkt;
import ee.itcollege.team11.PiirivalvurPiiripunkti;
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

privileged aspect AmetPiiripunktiController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String AmetPiiripunktiController.create(@Valid AmetPiiripunkti ametPiiripunkti, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ametPiiripunkti", ametPiiripunkti);
            return "ametpiiripunktis/create";
        }
        uiModel.asMap().clear();
        ametPiiripunkti.persist();
        return "redirect:/ametpiiripunktis/" + encodeUrlPathSegment(ametPiiripunkti.getAmetPiiripunktisId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String AmetPiiripunktiController.createForm(Model uiModel) {
        uiModel.addAttribute("ametPiiripunkti", new AmetPiiripunkti());
        return "ametpiiripunktis/create";
    }
    
    @RequestMapping(value = "/{ametPiiripunktisId}", method = RequestMethod.GET)
    public String AmetPiiripunktiController.show(@PathVariable("ametPiiripunktisId") Long ametPiiripunktisId, Model uiModel) {
        uiModel.addAttribute("ametpiiripunkti", AmetPiiripunkti.findAmetPiiripunkti(ametPiiripunktisId));
        uiModel.addAttribute("itemId", ametPiiripunktisId);
        return "ametpiiripunktis/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String AmetPiiripunktiController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("ametpiiripunktis", AmetPiiripunkti.findAmetPiiripunktiEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) AmetPiiripunkti.countAmetPiiripunktis() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ametpiiripunktis", AmetPiiripunkti.findAllAmetPiiripunktis());
        }
        return "ametpiiripunktis/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AmetPiiripunktiController.update(@Valid AmetPiiripunkti ametPiiripunkti, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ametPiiripunkti", ametPiiripunkti);
            return "ametpiiripunktis/update";
        }
        uiModel.asMap().clear();
        ametPiiripunkti.merge();
        return "redirect:/ametpiiripunktis/" + encodeUrlPathSegment(ametPiiripunkti.getAmetPiiripunktisId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{ametPiiripunktisId}", params = "form", method = RequestMethod.GET)
    public String AmetPiiripunktiController.updateForm(@PathVariable("ametPiiripunktisId") Long ametPiiripunktisId, Model uiModel) {
        uiModel.addAttribute("ametPiiripunkti", AmetPiiripunkti.findAmetPiiripunkti(ametPiiripunktisId));
        return "ametpiiripunktis/update";
    }
    
    @RequestMapping(value = "/{ametPiiripunktisId}", method = RequestMethod.DELETE)
    public String AmetPiiripunktiController.delete(@PathVariable("ametPiiripunktisId") Long ametPiiripunktisId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AmetPiiripunkti.findAmetPiiripunkti(ametPiiripunktisId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ametpiiripunktis";
    }
    
    @ModelAttribute("amets")
    public Collection<Amet> AmetPiiripunktiController.populateAmets() {
        return Amet.findAllAmets();
    }
    
    @ModelAttribute("ametpiiripunktis")
    public Collection<AmetPiiripunkti> AmetPiiripunktiController.populateAmetPiiripunktis() {
        return AmetPiiripunkti.findAllAmetPiiripunktis();
    }
    
    @ModelAttribute("piiripunkts")
    public Collection<Piiripunkt> AmetPiiripunktiController.populatePiiripunkts() {
        return Piiripunkt.findAllPiiripunkts();
    }
    
    @ModelAttribute("piirivalvurpiiripunktis")
    public Collection<PiirivalvurPiiripunkti> AmetPiiripunktiController.populatePiirivalvurPiiripunktis() {
        return PiirivalvurPiiripunkti.findAllPiirivalvurPiiripunktis();
    }
    
    String AmetPiiripunktiController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
