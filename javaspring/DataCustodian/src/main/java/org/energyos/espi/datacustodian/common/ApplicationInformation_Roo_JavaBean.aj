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

package org.energyos.espi.datacustodian.common;

import java.net.URI;
import org.energyos.espi.datacustodian.common.ApplicationInformation;
import org.energyos.espi.datacustodian.common.DataCustodianApplicationStatus;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationStatus;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationType;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationUse;

privileged aspect ApplicationInformation_Roo_JavaBean {
    
    public DataCustodianApplicationStatus ApplicationInformation.getDataCustodianApplicationStatus() {
        return this.dataCustodianApplicationStatus;
    }
    
    public void ApplicationInformation.setDataCustodianApplicationStatus(DataCustodianApplicationStatus dataCustodianApplicationStatus) {
        this.dataCustodianApplicationStatus = dataCustodianApplicationStatus;
    }
    
    public URI ApplicationInformation.getDataCustodianDefaultBatchResource() {
        return this.dataCustodianDefaultBatchResource;
    }
    
    public void ApplicationInformation.setDataCustodianDefaultBatchResource(URI dataCustodianDefaultBatchResource) {
        this.dataCustodianDefaultBatchResource = dataCustodianDefaultBatchResource;
    }
    
    public URI ApplicationInformation.getDataCustodianDefaultSubscriptionResource() {
        return this.dataCustodianDefaultSubscriptionResource;
    }
    
    public void ApplicationInformation.setDataCustodianDefaultSubscriptionResource(URI dataCustodianDefaultSubscriptionResource) {
        this.dataCustodianDefaultSubscriptionResource = dataCustodianDefaultSubscriptionResource;
    }
    
    public String ApplicationInformation.getDataCustodianThirdPartyId() {
        return this.dataCustodianThirdPartyId;
    }
    
    public void ApplicationInformation.setDataCustodianThirdPartyId(String dataCustodianThirdPartyId) {
        this.dataCustodianThirdPartyId = dataCustodianThirdPartyId;
    }
    
    public String ApplicationInformation.getDataCustodianThirdPartySecret() {
        return this.dataCustodianThirdPartySecret;
    }
    
    public void ApplicationInformation.setDataCustodianThirdPartySecret(String dataCustodianThirdPartySecret) {
        this.dataCustodianThirdPartySecret = dataCustodianThirdPartySecret;
    }
    
    public String ApplicationInformation.getThirdPartyApplicationDescription() {
        return this.thirdPartyApplicationDescription;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationDescription(String thirdPartyApplicationDescription) {
        this.thirdPartyApplicationDescription = thirdPartyApplicationDescription;
    }
    
    public URI ApplicationInformation.getThirdPartyApplicationLogo() {
        return this.thirdPartyApplicationLogo;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationLogo(URI thirdPartyApplicationLogo) {
        this.thirdPartyApplicationLogo = thirdPartyApplicationLogo;
    }
    
    public String ApplicationInformation.getThirdPartyApplicationName() {
        return this.thirdPartyApplicationName;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationName(String thirdPartyApplicationName) {
        this.thirdPartyApplicationName = thirdPartyApplicationName;
    }
    
    public ThirdPartyApplicationStatus ApplicationInformation.getThirdPartyApplicationStatus() {
        return this.thirdPartyApplicationStatus;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationStatus(ThirdPartyApplicationStatus thirdPartyApplicationStatus) {
        this.thirdPartyApplicationStatus = thirdPartyApplicationStatus;
    }
    
    public ThirdPartyApplicationType ApplicationInformation.getThirdPartyApplicationType() {
        return this.thirdPartyApplicationType;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationType(ThirdPartyApplicationType thirdPartyApplicationType) {
        this.thirdPartyApplicationType = thirdPartyApplicationType;
    }
    
    public ThirdPartyApplicationUse ApplicationInformation.getThirdPartyApplicationUse() {
        return this.thirdPartyApplicationUse;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationUse(ThirdPartyApplicationUse thirdPartyApplicationUse) {
        this.thirdPartyApplicationUse = thirdPartyApplicationUse;
    }
    
    public URI ApplicationInformation.getThirdPartyApplicationWebsite() {
        return this.thirdPartyApplicationWebsite;
    }
    
    public void ApplicationInformation.setThirdPartyApplicationWebsite(URI thirdPartyApplicationWebsite) {
        this.thirdPartyApplicationWebsite = thirdPartyApplicationWebsite;
    }
    
    public URI ApplicationInformation.getThirdPartyDefaultBatchResource() {
        return this.thirdPartyDefaultBatchResource;
    }
    
    public void ApplicationInformation.setThirdPartyDefaultBatchResource(URI thirdPartyDefaultBatchResource) {
        this.thirdPartyDefaultBatchResource = thirdPartyDefaultBatchResource;
    }
    
    public URI ApplicationInformation.getThirdPartyDefaultNotifyResource() {
        return this.thirdPartyDefaultNotifyResource;
    }
    
    public void ApplicationInformation.setThirdPartyDefaultNotifyResource(URI thirdPartyDefaultNotifyResource) {
        this.thirdPartyDefaultNotifyResource = thirdPartyDefaultNotifyResource;
    }
    
    public URI ApplicationInformation.getThirdPartyDefaultOAuthCallback() {
        return this.thirdPartyDefaultOAuthCallback;
    }
    
    public void ApplicationInformation.setThirdPartyDefaultOAuthCallback(URI thirdPartyDefaultOAuthCallback) {
        this.thirdPartyDefaultOAuthCallback = thirdPartyDefaultOAuthCallback;
    }
    
    public String ApplicationInformation.getThirdPartyEmail() {
        return this.thirdPartyEmail;
    }
    
    public void ApplicationInformation.setThirdPartyEmail(String thirdPartyEmail) {
        this.thirdPartyEmail = thirdPartyEmail;
    }
    
    public String ApplicationInformation.getThirdPartyName() {
        return this.thirdPartyName;
    }
    
    public void ApplicationInformation.setThirdPartyName(String thirdPartyName) {
        this.thirdPartyName = thirdPartyName;
    }
    
    public String ApplicationInformation.getThirdPartyPhone() {
        return this.thirdPartyPhone;
    }
    
    public void ApplicationInformation.setThirdPartyPhone(String thirdPartyPhone) {
        this.thirdPartyPhone = thirdPartyPhone;
    }
    
}
