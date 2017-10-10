package com.tradeshift.ups.logging;

import org.springframework.stereotype.Component;

import com.tradeshift.commons.auditlog.servlet.InternalHttpRequestContextSetupFilter;

@Component("requestContextSetupFilter")
public class RequestContextSetupFilter extends InternalHttpRequestContextSetupFilter {

    public RequestContextSetupFilter() {
        setRequestEventId("ups:request");
    }
}
