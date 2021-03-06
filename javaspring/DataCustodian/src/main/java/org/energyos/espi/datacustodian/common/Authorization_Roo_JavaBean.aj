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
import org.energyos.espi.datacustodian.common.Authorization;
import org.energyos.espi.datacustodian.common.AuthorizationStatus;
import org.energyos.espi.datacustodian.common.DateTimeInterval;

privileged aspect Authorization_Roo_JavaBean {
    
    public String Authorization.getAccessToken() {
        return this.accessToken;
    }
    
    public void Authorization.setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }
    
    public URI Authorization.getAuthorizationServer() {
        return this.authorizationServer;
    }
    
    public void Authorization.setAuthorizationServer(URI authorizationServer) {
        this.authorizationServer = authorizationServer;
    }
    
    public DateTimeInterval Authorization.getAuthorizedPeriod() {
        return this.authorizedPeriod;
    }
    
    public void Authorization.setAuthorizedPeriod(DateTimeInterval authorizedPeriod) {
        this.authorizedPeriod = authorizedPeriod;
    }
    
    public DateTimeInterval Authorization.getPublishedPeriod() {
        return this.publishedPeriod;
    }
    
    public void Authorization.setPublishedPeriod(DateTimeInterval publishedPeriod) {
        this.publishedPeriod = publishedPeriod;
    }
    
    public URI Authorization.getResource() {
        return this.resource;
    }
    
    public void Authorization.setResource(URI resource) {
        this.resource = resource;
    }
    
    public AuthorizationStatus Authorization.getStatus() {
        return this.status;
    }
    
    public void Authorization.setStatus(AuthorizationStatus status) {
        this.status = status;
    }
    
    public String Authorization.getThirdParty() {
        return this.thirdParty;
    }
    
    public void Authorization.setThirdParty(String thirdParty) {
        this.thirdParty = thirdParty;
    }
    
}
