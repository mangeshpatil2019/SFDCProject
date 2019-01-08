global class VlocityOverrideImplementation implements vlocity_ins.VlocityOpenInterface2 {

    global Object invokeMethod(String methodName,
            Map<String,Object> inputs,
            Map<String,Object> output,
            Map<String,Object> options)
    {
        if (methodName == 'query')
        {
            output.put('query', Database.query(String.valueOf(inputs.get('queryString'))));
            return true;
        }
        
        else if (methodName == 'getEmptyList')
        {
            output.put('emptyList', JSON.deserialize('[]', Type.forName('List<' + inputs.get('objectType') +'>')));
            return true;
        }
        
        else if (methodName == 'getSchemaGlobalDescribe')
        {
            Map<String, Schema.SObjectType> globalMap = new Map<String, Schema.SObjectType>();
            
            for (Schema.SObjectType field : Schema.getGlobalDescribe().values())
            {
                globalMap.put(String.valueOf(field).toLowerCase(), field);
            }
            
            output.put('schemaGlobalDescribe', globalMap);
            return true;
        }
        
        return false;
    }
}