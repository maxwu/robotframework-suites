*** Settings ***
Documentation	This suite is a sample to demonstrate list in robot framework.
...		Current test suite is in space delimited format.
...		Last line of doc.
Force Tags	Demo 
Library		OperatingSystem

*** Variables ***
# The host list to ping in loop
@{hosts}    www.yahoo.com   www.google.com  www.trademe.co.nz
...	    www.zhihu.com

*** Test Cases ***
This is a ping test to a list of hosts.
    [Documentation]	The Ping Test to hosts.
    [Tags]	Ping	CLI

    : FOR   ${tgt}  IN	@{hosts}
    \	${ip}	${delay}    ${edge}=  ping_func	${tgt}
    \	Log	\nPing Test Result: IP=${ip}, Delay=${delay}ms	console=True	html=True
	# It shall be <50, however the network at present is not smoothy enough.
    \	Should Be True	${delay} < 200

    # Print a table into final HTML report.
    Log	    Printing an HTML table.
    Log	    <table border="1"> <tr><td>Cell1</td><td>Cell2</td></tr> </table>    html=True

The Ping test to a list of IPs.
    [Documentation]	The Ping Test to IP addresses.
    [Tags]	Ping	CLI	@feature=ping

    @{vlist}=	create list	8.8.8.8	8.8.4.4
    : For   ${vip}  IN	@{vlist}
    \	${ip}	${delay}    ${edege}=  ping_func	${vip}
    \	Log	\nPing Test Results: delay=${delay}ms	console=True	html=True
    \	Should be True	${delay} < 100
    
*** Keywords ***
ping_func
    [Arguments]	    ${host}
    [Tags]	    FUNC    CLI	    Ping
    ${output} =	    Run	    "pwd"
    # The shell cmd works on Mac and Linux.
    ${result} =	    Run	    ping -c1 ${host}
    # "Should match regexp" returns the matching part and groups in following.
    ${match}	${edge}	    ${ip} =    should match regexp    ${result}	PING\\s+(\\S+)\\s*\\((\\d+\\.\\d+\\.\\d+\\.\\d+)\\)
    ${match}    ${delay} =  should match regexp	    ${result}	time=(\\S+)\\s*ms
    [Return]	${ip}	${delay}    ${edge}

