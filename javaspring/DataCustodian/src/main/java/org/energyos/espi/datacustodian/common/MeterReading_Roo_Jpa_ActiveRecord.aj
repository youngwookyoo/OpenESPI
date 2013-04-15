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

import java.util.List;
import org.energyos.espi.datacustodian.common.MeterReading;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MeterReading_Roo_Jpa_ActiveRecord {
    
    public static long MeterReading.countMeterReadings() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MeterReading o", Long.class).getSingleResult();
    }
    
    public static List<MeterReading> MeterReading.findAllMeterReadings() {
        return entityManager().createQuery("SELECT o FROM MeterReading o", MeterReading.class).getResultList();
    }
    
    public static MeterReading MeterReading.findMeterReading(Long id) {
        if (id == null) return null;
        return entityManager().find(MeterReading.class, id);
    }
    
    public static List<MeterReading> MeterReading.findMeterReadingEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MeterReading o", MeterReading.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public MeterReading MeterReading.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MeterReading merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
