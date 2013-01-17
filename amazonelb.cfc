<cfcomponent output="false">

  <cffunction name="init" access="public" output="false">
    <cfscript>
      this.version = "1.1.8"; 
    </cfscript>
    <cfreturn this />
  </cffunction>

  <cffunction name="getIpAddress" returntype="struct" access="public" output="false">
    <cfargument name="remoteAddr" type="string" required="false" default="#cgi.remote_addr#" />
    <cfargument name="xForwardedFor" type="string" required="false" default="#cgi['X-Forwarded-For']#" />
    <cfscript>
      if (len(arguments.xForwardedFor) and listLen(arguments.xForwardedFor) == 4)
        return arguments.xForwardedFor;
    </cfscript>
    <cfreturn arguments.remoteAddr />
  </cffunction>

  <cffunction name="getServerProtocol" access="public" output="false" returntype="string">
    <cfargument name="serverPortSecure" type="boolean" required="false" default="#cgi.server_port_secure#" />
    <cfargument name="xForwardedProto" type="string" required="false" default="#cgi['X-Forwarded-Proto']#" />
    <cfscript>
      if (len(arguments.xForwardedProto))
        return arguments.xForwardedProto;
    </cfscript>
    <cfreturn (arguments.serverPortSecure) ? "https" : "http" />
  </cffunction>

  <cffunction name="getServerPort" access="public" output="false" returntype="numeric">
    <cfargument name="serverPort" type="numeric" required="false" default="#cgi.server_port#" />
    <cfargument name="xForwardedPort" type="any" required="false" default="#cgi['X-Forwarded-Port']#" />
    <cfscript>
      if (len(arguments.xForwardedPort) and isNumeric(arguments.xForwardedPort))
        return arguments.xForwardedPort;
    </cfscript>
    <cfreturn arguemnts.serverPort />
  </cffunction>
  
</cfcomponent>