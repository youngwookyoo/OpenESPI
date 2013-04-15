/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/


// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.web;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationType;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationTypeEnum;
import org.energyos.espi.datacustodian.web.ThirdPartyApplicationTypeController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ThirdPartyApplicationTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ThirdPartyApplicationTypeController.create(@Valid ThirdPartyApplicationType thirdPartyApplicationType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, thirdPartyApplicationType);
            return "thirdpartyapplicationtypes/create";
        }
        uiModel.asMap().clear();
        thirdPartyApplicationType.persist();
        return "redirect:/thirdpartyapplicationtypes/" + encodeUrlPathSegment(thirdPartyApplicationType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ThirdPartyApplicationTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ThirdPartyApplicationType());
        return "thirdpartyapplicationtypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ThirdPartyApplicationTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("thirdpartyapplicationtype", ThirdPartyApplicationType.findThirdPartyApplicationType(id));
        uiModel.addAttribute("itemId", id);
        return "thirdpartyapplicationtypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ThirdPartyApplicationTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("thirdpartyapplicationtypes", ThirdPartyApplicationType.findThirdPartyApplicationTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) ThirdPartyApplicationType.countThirdPartyApplicationTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("thirdpartyapplicationtypes", ThirdPartyApplicationType.findAllThirdPartyApplicationTypes());
        }
        return "thirdpartyapplicationtypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ThirdPartyApplicationTypeController.update(@Valid ThirdPartyApplicationType thirdPartyApplicationType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, thirdPartyApplicationType);
            return "thirdpartyapplicationtypes/update";
        }
        uiModel.asMap().clear();
        thirdPartyApplicationType.merge();
        return "redirect:/thirdpartyapplicationtypes/" + encodeUrlPathSegment(thirdPartyApplicationType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ThirdPartyApplicationTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ThirdPartyApplicationType.findThirdPartyApplicationType(id));
        return "thirdpartyapplicationtypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ThirdPartyApplicationTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ThirdPartyApplicationType thirdPartyApplicationType = ThirdPartyApplicationType.findThirdPartyApplicationType(id);
        thirdPartyApplicationType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/thirdpartyapplicationtypes";
    }
    
    void ThirdPartyApplicationTypeController.populateEditForm(Model uiModel, ThirdPartyApplicationType thirdPartyApplicationType) {
        uiModel.addAttribute("thirdPartyApplicationType", thirdPartyApplicationType);
        uiModel.addAttribute("thirdpartyapplicationtypeenums", Arrays.asList(ThirdPartyApplicationTypeEnum.values()));
    }
    
    String ThirdPartyApplicationTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
