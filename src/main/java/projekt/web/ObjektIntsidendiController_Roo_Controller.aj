// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.Intsident;
import ee.itcollege.team11.Objekt;
import ee.itcollege.team11.ObjektIntsidendi;
import ee.itcollege.team11.ObjektiSeadusIntsidendi;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ObjektIntsidendiController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ObjektIntsidendiController.create(@Valid ObjektIntsidendi objektIntsidendi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("objektIntsidendi", objektIntsidendi);
            addDateTimeFormatPatterns(uiModel);
            return "objektintsidendis/create";
        }
        uiModel.asMap().clear();
        objektIntsidendi.persist();
        return "redirect:/objektintsidendis/" + encodeUrlPathSegment(objektIntsidendi.getObjektIntsidendisId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ObjektIntsidendiController.createForm(Model uiModel) {
        uiModel.addAttribute("objektIntsidendi", new ObjektIntsidendi());
        addDateTimeFormatPatterns(uiModel);
        return "objektintsidendis/create";
    }
    
    @RequestMapping(value = "/{objektIntsidendisId}", method = RequestMethod.GET)
    public String ObjektIntsidendiController.show(@PathVariable("objektIntsidendisId") Long objektIntsidendisId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("objektintsidendi", ObjektIntsidendi.findObjektIntsidendi(objektIntsidendisId));
        uiModel.addAttribute("itemId", objektIntsidendisId);
        return "objektintsidendis/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ObjektIntsidendiController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("objektintsidendis", ObjektIntsidendi.findObjektIntsidendiEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ObjektIntsidendi.countObjektIntsidendis() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("objektintsidendis", ObjektIntsidendi.findAllObjektIntsidendis());
        }
        addDateTimeFormatPatterns(uiModel);
        return "objektintsidendis/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ObjektIntsidendiController.update(@Valid ObjektIntsidendi objektIntsidendi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("objektIntsidendi", objektIntsidendi);
            addDateTimeFormatPatterns(uiModel);
            return "objektintsidendis/update";
        }
        uiModel.asMap().clear();
        objektIntsidendi.merge();
        return "redirect:/objektintsidendis/" + encodeUrlPathSegment(objektIntsidendi.getObjektIntsidendisId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{objektIntsidendisId}", params = "form", method = RequestMethod.GET)
    public String ObjektIntsidendiController.updateForm(@PathVariable("objektIntsidendisId") Long objektIntsidendisId, Model uiModel) {
        uiModel.addAttribute("objektIntsidendi", ObjektIntsidendi.findObjektIntsidendi(objektIntsidendisId));
        addDateTimeFormatPatterns(uiModel);
        return "objektintsidendis/update";
    }
    
    @RequestMapping(value = "/{objektIntsidendisId}", method = RequestMethod.DELETE)
    public String ObjektIntsidendiController.delete(@PathVariable("objektIntsidendisId") Long objektIntsidendisId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ObjektIntsidendi.findObjektIntsidendi(objektIntsidendisId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/objektintsidendis";
    }
    
    @ModelAttribute("intsidents")
    public Collection<Intsident> ObjektIntsidendiController.populateIntsidents() {
        return Intsident.findAllIntsidents();
    }
    
    @ModelAttribute("objekts")
    public Collection<Objekt> ObjektIntsidendiController.populateObjekts() {
        return Objekt.findAllObjekts();
    }
    
    @ModelAttribute("objektintsidendis")
    public Collection<ObjektIntsidendi> ObjektIntsidendiController.populateObjektIntsidendis() {
        return ObjektIntsidendi.findAllObjektIntsidendis();
    }
    
    @ModelAttribute("objektiseadusintsidendis")
    public Collection<ObjektiSeadusIntsidendi> ObjektIntsidendiController.populateObjektiSeadusIntsidendis() {
        return ObjektiSeadusIntsidendi.findAllObjektiSeadusIntsidendis();
    }
    
    void ObjektIntsidendiController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("objektIntsidendi_alates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektIntsidendi_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektIntsidendi_kuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektIntsidendi_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("objektIntsidendi_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String ObjektIntsidendiController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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