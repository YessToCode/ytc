public class autoConvertLeads {
	@invocableMethod
    public static void leadAssign(List<Id> leadIds){
        leadStatus cLeadStatus = [SELECT id, MasterLabel FROM LeadStatus WHERE isConverted = true LIMIT 1];
        system.debug('Lead Id>>>'+leadIds);
        List<Database.leadConvert> massLeadConvert =  new List<Database.leadConvert>();
        for(id currentLead: leadIds){
            Database.leadConvert LeadConvert = new Database.leadConvert();
            LeadConvert.setLeadId(currentLead);
            LeadConvert.setConvertedStatus(cLeadStatus.MasterLabel);
            LeadConvert.setDoNotCreateOpportunity(True);
            massLeadConvert.add(LeadConvert);
        }
        
        if(!massLeadConvert.isEmpty()){
            List<Database.LeadConvertResult> Icr = Database.convertLead(massLeadConvert);
        }
    }
}