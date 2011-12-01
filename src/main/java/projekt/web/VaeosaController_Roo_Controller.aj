// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package projekt.web;

import ee.itcollege.team11.AmetVaeosa;
import ee.itcollege.team11.OrgYksus;
import ee.itcollege.team11.PiiriloiguHaldaja;
import ee.itcollege.team11.PiiripunktiAlluvus;
import ee.itcollege.team11.RiigiAdminYksus;
import ee.itcollege.team11.Vaeosa;
import ee.itcollege.team11.VaeosaAlluvus;
import ee.itcollege.team11.Vahtkond;
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

privileged aspect VaeosaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VaeosaController.create(@Valid Vaeosa vaeosa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vaeosa", vaeosa);
            addDateTimeFormatPatterns(uiModel);
            return "vaeosas/create";
        }
        uiModel.asMap().clear();
        vaeosa.persist();
        return "redirect:/vaeosas/" + encodeUrlPathSegment(vaeosa.getVaeosaIdId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VaeosaController.createForm(Model uiModel) {
        uiModel.addAttribute("vaeosa", new Vaeosa());
        addDateTimeFormatPatterns(uiModel);
        return "vaeosas/create";
    }
    
    @RequestMapping(value = "/{vaeosaIdId}", method = RequestMethod.GET)
    public String VaeosaController.show(@PathVariable("vaeosaIdId") Long vaeosaIdId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vaeosa", Vaeosa.findVaeosa(vaeosaIdId));
        uiModel.addAttribute("itemId", vaeosaIdId);
        return "vaeosas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VaeosaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vaeosas", Vaeosa.findVaeosaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Vaeosa.countVaeosas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vaeosas", Vaeosa.findAllVaeosas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vaeosas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VaeosaController.update(@Valid Vaeosa vaeosa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vaeosa", vaeosa);
            addDateTimeFormatPatterns(uiModel);
            return "vaeosas/update";
        }
        uiModel.asMap().clear();
        vaeosa.merge();
        return "redirect:/vaeosas/" + encodeUrlPathSegment(vaeosa.getVaeosaIdId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{vaeosaIdId}", method = RequestMethod.DELETE)
    public String VaeosaController.delete(@PathVariable("vaeosaIdId") Long vaeosaIdId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Vaeosa.findVaeosa(vaeosaIdId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vaeosas";
    }
    
    @ModelAttribute("ametvaeosas")
    public Collection<AmetVaeosa> VaeosaController.populateAmetVaeosas() {
        return AmetVaeosa.findAllAmetVaeosas();
    }
    
    @ModelAttribute("orgyksuses")
    public Collection<OrgYksus> VaeosaController.populateOrgYksuses() {
        return OrgYksus.findAllOrgYksuses();
    }
    
    @ModelAttribute("piiriloiguhaldajas")
    public Collection<PiiriloiguHaldaja> VaeosaController.populatePiiriloiguHaldajas() {
        return PiiriloiguHaldaja.findAllPiiriloiguHaldajas();
    }
    
    @ModelAttribute("piiripunktialluvuses")
    public Collection<PiiripunktiAlluvus> VaeosaController.populatePiiripunktiAlluvuses() {
        return PiiripunktiAlluvus.findAllPiiripunktiAlluvuses();
    }
    
    @ModelAttribute("riigiadminyksuses")
    public Collection<RiigiAdminYksus> VaeosaController.populateRiigiAdminYksuses() {
        return RiigiAdminYksus.findAllRiigiAdminYksuses();
    }
    
    @ModelAttribute("vaeosas")
    public Collection<Vaeosa> VaeosaController.populateVaeosas() {
        return Vaeosa.findAllVaeosas();
    }
    
    @ModelAttribute("vaeosaalluvuses")
    public Collection<VaeosaAlluvus> VaeosaController.populateVaeosaAlluvuses() {
        return VaeosaAlluvus.findAllVaeosaAlluvuses();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<Vahtkond> VaeosaController.populateVahtkonds() {
        return Vahtkond.findAllVahtkonds();
    }
    
    void VaeosaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vaeosa_alates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vaeosa_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vaeosa_kuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vaeosa_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vaeosa_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String VaeosaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
