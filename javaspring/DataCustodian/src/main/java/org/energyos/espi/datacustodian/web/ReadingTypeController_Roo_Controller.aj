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
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.energyos.espi.datacustodian.common.AccumulationBehavior;
import org.energyos.espi.datacustodian.common.CPP;
import org.energyos.espi.datacustodian.common.Commodity;
import org.energyos.espi.datacustodian.common.ConsumptionTier;
import org.energyos.espi.datacustodian.common.Currency;
import org.energyos.espi.datacustodian.common.DataQualifier;
import org.energyos.espi.datacustodian.common.DirectionOfFlow;
import org.energyos.espi.datacustodian.common.Kind;
import org.energyos.espi.datacustodian.common.PhaseCode;
import org.energyos.espi.datacustodian.common.RationalNumber;
import org.energyos.espi.datacustodian.common.ReadingInterharmonic;
import org.energyos.espi.datacustodian.common.ReadingType;
import org.energyos.espi.datacustodian.common.TOU;
import org.energyos.espi.datacustodian.common.TimeAttribute;
import org.energyos.espi.datacustodian.common.UnitMultiplier;
import org.energyos.espi.datacustodian.common.UnitSymbol;
import org.energyos.espi.datacustodian.web.ReadingTypeController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ReadingTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ReadingTypeController.create(@Valid ReadingType readingType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, readingType);
            return "readingtypes/create";
        }
        uiModel.asMap().clear();
        readingType.persist();
        return "redirect:/readingtypes/" + encodeUrlPathSegment(readingType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ReadingTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ReadingType());
        return "readingtypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ReadingTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("readingtype", ReadingType.findReadingType(id));
        uiModel.addAttribute("itemId", id);
        return "readingtypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ReadingTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("readingtypes", ReadingType.findReadingTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) ReadingType.countReadingTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("readingtypes", ReadingType.findAllReadingTypes());
        }
        return "readingtypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ReadingTypeController.update(@Valid ReadingType readingType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, readingType);
            return "readingtypes/update";
        }
        uiModel.asMap().clear();
        readingType.merge();
        return "redirect:/readingtypes/" + encodeUrlPathSegment(readingType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ReadingTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ReadingType.findReadingType(id));
        return "readingtypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ReadingTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ReadingType readingType = ReadingType.findReadingType(id);
        readingType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/readingtypes";
    }
    
    void ReadingTypeController.populateEditForm(Model uiModel, ReadingType readingType) {
        uiModel.addAttribute("readingType", readingType);
        uiModel.addAttribute("accumulationbehaviors", AccumulationBehavior.findAllAccumulationBehaviors());
        uiModel.addAttribute("cpps", CPP.findAllCPPS());
        uiModel.addAttribute("commoditys", Commodity.findAllCommoditys());
        uiModel.addAttribute("consumptiontiers", ConsumptionTier.findAllConsumptionTiers());
        uiModel.addAttribute("currencys", Currency.findAllCurrencys());
        uiModel.addAttribute("dataqualifiers", DataQualifier.findAllDataQualifiers());
        uiModel.addAttribute("directionofflows", DirectionOfFlow.findAllDirectionOfFlows());
        uiModel.addAttribute("kinds", Kind.findAllKinds());
        uiModel.addAttribute("phasecodes", PhaseCode.findAllPhaseCodes());
        uiModel.addAttribute("rationalnumbers", RationalNumber.findAllRationalNumbers());
        uiModel.addAttribute("readinginterharmonics", ReadingInterharmonic.findAllReadingInterharmonics());
        uiModel.addAttribute("tous", TOU.findAllTOUS());
        uiModel.addAttribute("timeattributes", TimeAttribute.findAllTimeAttributes());
        uiModel.addAttribute("unitmultipliers", UnitMultiplier.findAllUnitMultipliers());
        uiModel.addAttribute("unitsymbols", UnitSymbol.findAllUnitSymbols());
    }
    
    String ReadingTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
