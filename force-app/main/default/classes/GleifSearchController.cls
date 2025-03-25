/**
* @File Name : GleifSearchController.cls
* @Description :
* @Author : Lola
* @Last Modified By :
* @Last Modified On : March 24, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | March 24, 2025 |   | Initial Version
**/
public with sharing class GleifSearchController {
    @AuraEnabled(cacheable=true)
    public static LegalEntity__c fetchEntity(String lei) {
        List<LegalEntity__c> results = [SELECT name, Country__c, RegistrationDate__c, Status__c, Jurisdiction__c, LegalForm__c, InitialRegistrationDate__c, LastUpdateDate__c, ExpirationDate__c, PostalCode__c FROM LegalEntity__c WHERE LEI__c = :lei];
        if (!results.isEmpty()) {
            return results[0];
        } else {
            throw new AuraException('No Legal Entity found with LEI: ' + lei);
        }
    }
}