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

import org.energyos.espi.datacustodian.common.ServiceCategory;
import org.energyos.espi.datacustodian.common.UsagePoint;
import org.energyos.espi.datacustodian.domain.Address;
import org.energyos.espi.datacustodian.domain.DataCustodian;
import org.energyos.espi.datacustodian.domain.Location;
import org.energyos.espi.datacustodian.domain.RetailCustomer;

privileged aspect UsagePoint_Roo_JavaBean {
    
    public Short UsagePoint.getRoleFlags() {
        return this.roleFlags;
    }
    
    public void UsagePoint.setRoleFlags(Short roleFlags) {
        this.roleFlags = roleFlags;
    }
    
    public ServiceCategory UsagePoint.getServiceCategory() {
        return this.serviceCategory;
    }
    
    public void UsagePoint.setServiceCategory(ServiceCategory serviceCategory) {
        this.serviceCategory = serviceCategory;
    }
    
    public Byte UsagePoint.getUP_status() {
        return this.UP_status;
    }
    
    public void UsagePoint.setUP_status(Byte UP_status) {
        this.UP_status = UP_status;
    }
    
    public Address UsagePoint.getAddress() {
        return this.address;
    }
    
    public void UsagePoint.setAddress(Address address) {
        this.address = address;
    }
    
    public Location UsagePoint.getLocation() {
        return this.location;
    }
    
    public void UsagePoint.setLocation(Location location) {
        this.location = location;
    }
    
    public RetailCustomer UsagePoint.getRetailCustomer() {
        return this.retailCustomer;
    }
    
    public void UsagePoint.setRetailCustomer(RetailCustomer retailCustomer) {
        this.retailCustomer = retailCustomer;
    }
    
    public DataCustodian UsagePoint.getDataCustodian() {
        return this.dataCustodian;
    }
    
    public void UsagePoint.setDataCustodian(DataCustodian dataCustodian) {
        this.dataCustodian = dataCustodian;
    }
    
}
