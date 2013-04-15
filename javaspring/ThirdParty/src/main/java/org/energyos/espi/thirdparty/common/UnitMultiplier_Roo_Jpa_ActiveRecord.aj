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

package org.energyos.espi.thirdparty.common;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.energyos.espi.thirdparty.common.UnitMultiplier;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UnitMultiplier_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager UnitMultiplier.entityManager;
    
    public static final EntityManager UnitMultiplier.entityManager() {
        EntityManager em = new UnitMultiplier().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UnitMultiplier.countUnitMultipliers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UnitMultiplier o", Long.class).getSingleResult();
    }
    
    public static List<UnitMultiplier> UnitMultiplier.findAllUnitMultipliers() {
        return entityManager().createQuery("SELECT o FROM UnitMultiplier o", UnitMultiplier.class).getResultList();
    }
    
    public static UnitMultiplier UnitMultiplier.findUnitMultiplier(Long id) {
        if (id == null) return null;
        return entityManager().find(UnitMultiplier.class, id);
    }
    
    public static List<UnitMultiplier> UnitMultiplier.findUnitMultiplierEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UnitMultiplier o", UnitMultiplier.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void UnitMultiplier.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UnitMultiplier.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UnitMultiplier attached = UnitMultiplier.findUnitMultiplier(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UnitMultiplier.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UnitMultiplier.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public UnitMultiplier UnitMultiplier.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UnitMultiplier merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
