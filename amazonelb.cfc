<cfcomponent output="false">

  <cffunction name="init" access="public" output="false">
    <cfscript>
      this.version = "1.1.8"; 
    </cfscript>
    <cfreturn this />
  </cffunction>

  <cffunction name="$cgiScope" returntype="struct" access="public" output="false">
    <cfscript>
      var loc = {};
      var coreCgiScope = core.$cgiScope;

      loc.returnValue = coreCgiScope();

      if (len(cgi['X-Forwarded-For']))
        loc.returnValue.remote_addr = cgi['X-Forwarded-For'];
    </cfscript>
    <cfreturn loc.returnValue />
  </cffunction>
  
</cfcomponent>