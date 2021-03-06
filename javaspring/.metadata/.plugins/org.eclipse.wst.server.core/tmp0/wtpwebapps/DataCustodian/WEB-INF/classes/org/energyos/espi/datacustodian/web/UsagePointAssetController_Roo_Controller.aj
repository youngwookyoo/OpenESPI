// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.energyos.espi.datacustodian.domain.UsagePoint;
import org.energyos.espi.datacustodian.domain.UsagePointAsset;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UsagePointAssetController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String UsagePointAssetController.create(@Valid UsagePointAsset usagePointAsset, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("usagePointAsset", usagePointAsset);
            return "usagepointassets/create";
        }
        uiModel.asMap().clear();
        usagePointAsset.persist();
        return "redirect:/usagepointassets/" + encodeUrlPathSegment(usagePointAsset.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String UsagePointAssetController.createForm(Model uiModel) {
        uiModel.addAttribute("usagePointAsset", new UsagePointAsset());
        List dependencies = new ArrayList();
        if (UsagePoint.countUsagePoints() == 0) {
            dependencies.add(new String[]{"usagepoint", "usagepoints"});
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "usagepointassets/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String UsagePointAssetController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("usagepointasset", UsagePointAsset.findUsagePointAsset(id));
        uiModel.addAttribute("itemId", id);
        return "usagepointassets/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String UsagePointAssetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("usagepointassets", UsagePointAsset.findUsagePointAssetEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UsagePointAsset.countUsagePointAssets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("usagepointassets", UsagePointAsset.findAllUsagePointAssets());
        }
        return "usagepointassets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UsagePointAssetController.update(@Valid UsagePointAsset usagePointAsset, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("usagePointAsset", usagePointAsset);
            return "usagepointassets/update";
        }
        uiModel.asMap().clear();
        usagePointAsset.merge();
        return "redirect:/usagepointassets/" + encodeUrlPathSegment(usagePointAsset.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String UsagePointAssetController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("usagePointAsset", UsagePointAsset.findUsagePointAsset(id));
        return "usagepointassets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String UsagePointAssetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UsagePointAsset.findUsagePointAsset(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/usagepointassets";
    }
    
    @ModelAttribute("usagepoints")
    public Collection<UsagePoint> UsagePointAssetController.populateUsagePoints() {
        return UsagePoint.findAllUsagePoints();
    }
    
    @ModelAttribute("usagepointassets")
    public Collection<UsagePointAsset> UsagePointAssetController.populateUsagePointAssets() {
        return UsagePointAsset.findAllUsagePointAssets();
    }
    
    String UsagePointAssetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
