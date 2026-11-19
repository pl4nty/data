-- Threat: !InfrastructureShared
-- Name: MAPSGeoURLs
-- Type: 23

local l_0_0 = {
  "SOAP:https://unitedstates.cp.wd.microsoft.com/WdCpSrvc.asmx",
  "REST:https://unitedstates.cp.wd.microsoft.com/wdcp.svc/submitReport",
  "BOND:https://unitedstates.cp.wd.microsoft.com/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://unitedstates.x.cp.wd.microsoft.com/api/report",
  "XPLATTEST:{\"macTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2120136\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2144709\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"uri\":\"https://ussus1eastprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://ussus1westprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://unitedstates.x.cp.wd.microsoft.com/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://unitedstates.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_US", l_0_0, 1)
local l_0_1 = {
  "SOAP:https://mdav.us.stg.endpoint.security.microsoft-int.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.us.stg.endpoint.security.microsoft-int.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.us.stg.endpoint.security.microsoft-int.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.us.stg.endpoint.security.microsoft-int.com",
  "XPLATBROKER:https://mdav.us.stg.endpoint.security.microsoft-int.com/xplat/api/report",
  "DEFUPDATE:https://mdav.us.stg.endpoint.security.microsoft-int.com/packages/",
  "DEFUPDATEMAC:https://mdav.us.stg.endpoint.security.microsoft-int.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.us.stg.endpoint.security.microsoft-int.com/packages/?ostype=linux",
  "ECSURI:https://mdav.us.stg.endpoint.security.microsoft-int.com/ecs",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_SANDBOX", l_0_1, 1)
local l_0_2 = {
  "SOAP:https://wdcpppe.microsoft-ppe.com/WdCpSrvc.asmx",
  "REST:https://wdcpppe.microsoft-ppe.com/wdcp.svc/submitReport",
  "BOND:https://wdcpppe.microsoft-ppe.com/wdcp.svc/bond/submitreport",
  "XPLATBROKER:https://unitedstates.x.cp.wd.microsoft.com/api/report",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_SANDBOX", l_0_2, 1)
local l_0_3 = {
  "SOAP:https://europe.cp.wd.microsoft.com/WdCpSrvc.asmx",
  "REST:https://europe.cp.wd.microsoft.com/wdcp.svc/submitReport",
  "BOND:https://europe.cp.wd.microsoft.com/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://europe.x.cp.wd.microsoft.com/api/report",
  "XPLATTEST:{\"macTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2120136\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2144709\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"uri\":\"https://usseu1northprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://usseu1westprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://europe.x.cp.wd.microsoft.com/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://europe.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_EU", l_0_3, 1)
local l_0_4 = {
  "SOAP:https://australia.cp.wd.microsoft.com/WdCpSrvc.asmx",
  "REST:https://australia.cp.wd.microsoft.com/wdcp.svc/submitReport",
  "BOND:https://australia.cp.wd.microsoft.com/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://australia.x.cp.wd.microsoft.com/api/report",
  "XPLATTEST:{\"macTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2120136\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2144709\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"uri\":\"https://ussau1eastprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://ussau1southeastprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://australia.x.cp.wd.microsoft.com/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://australia.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_AU", l_0_4, 1)
local l_0_5 = {
  "SOAP:https://unitedkingdom.cp.wd.microsoft.com/WdCpSrvc.asmx",
  "REST:https://unitedkingdom.cp.wd.microsoft.com/wdcp.svc/submitReport",
  "BOND:https://unitedkingdom.cp.wd.microsoft.com/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://unitedkingdom.x.cp.wd.microsoft.com/api/report",
  "XPLATTEST:{\"macTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2120136\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2144709\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"uri\":\"https://ussuk1southprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://ussuk1westprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://unitedkingdom.x.cp.wd.microsoft.com/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://unitedkingdom.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_UK", l_0_5, 1)
local l_0_6 = {
  "SOAP:https://switzerland.cp.wd.microsoft.com/WdCpSrvc.asmx",
  "REST:https://switzerland.cp.wd.microsoft.com/wdcp.svc/submitReport",
  "BOND:https://switzerland.cp.wd.microsoft.com/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://switzerland.x.cp.wd.microsoft.com/api/report",
  "XPLATTEST:{\"macTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2120136\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2144709\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"uri\":\"https://ussch1northprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://ussch1westprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://switzerland.x.cp.wd.microsoft.com/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://switzerland.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_CH", l_0_6, 1)
local l_0_7 = {
  "SOAP:https://india.cp.wd.microsoft.com/WdCpSrvc.asmx",
  "REST:https://india.cp.wd.microsoft.com/wdcp.svc/submitReport",
  "BOND:https://india.cp.wd.microsoft.com/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://india.x.cp.wd.microsoft.com/api/report",
  "XPLATTEST:{\"macTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2120136\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"uri\":\"https://go.microsoft.com/fwlink/?linkid=2144709\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"uri\":\"https://ussin1southprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://ussin1centralprod.blob.core.windows.net/\",\"method\":\"GET\",\"response\":400},{\"uri\":\"https://india.x.cp.wd.microsoft.com/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://india.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_IN", l_0_7, 1)
local l_0_8 = {
  "SOAP:https://mdav.us.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.us.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.us.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.us.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.us.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.us.endpoint.security.microsoft.com/packages/",
  "DEFUPDATEMAC:https://mdav.us.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.us.endpoint.security.microsoft.com/packages/?ostype=linux",
  "ECSURI:https://mdav.us.endpoint.security.microsoft.com/ecs",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/ussus1eastprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/ussus1westprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://unitedstates.smartscreen.microsoft.com//api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_US", l_0_8, 1)
local l_0_9 = {
  "SOAP:https://mdav.eu.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.eu.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.eu.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.eu.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.eu.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.eu.endpoint.security.microsoft.com/packages/",
  "DEFUPDATEMAC:https://mdav.eu.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.eu.endpoint.security.microsoft.com/packages/?ostype=linux",
  "ECSURI:https://mdav.eu.endpoint.security.microsoft.com/ecs",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/usseu1northprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/usseu1westprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://europe.smartscreen.microsoft.com//api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_EU", l_0_9, 1)
local l_0_10 = {
  "SOAP:https://mdav.uk.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.uk.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.uk.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.uk.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.uk.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.uk.endpoint.security.microsoft.com/packages/",
  "DEFUPDATEMAC:https://mdav.uk.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.uk.endpoint.security.microsoft.com/packages/?ostype=linux",
  "ECSURI:https://mdav.uk.endpoint.security.microsoft.com/ecs",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/ussuk1southprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/ussuk1westprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://unitedkingdom.smartscreen.microsoft.com//api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_UK", l_0_10, 1)
local l_0_11 = {
  "SOAP:https://mdav.au.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.au.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.au.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.au.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.au.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.au.endpoint.security.microsoft.com/packages/",
  "DEFUPDATEMAC:https://mdav.au.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.au.endpoint.security.microsoft.com/packages/?ostype=linux",
  "ECSURI:https://mdav.au.endpoint.security.microsoft.com/ecs",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/ussau1eastprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/ussau1southeastprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://australia.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_AU", l_0_11, 1)
local l_0_12 = {
  "SOAP:https://mdav.ch.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.ch.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.ch.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.ch.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.ch.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.ch.endpoint.security.microsoft.com/packages/",
  "DEFUPDATEMAC:https://mdav.ch.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.ch.endpoint.security.microsoft.com/packages/?ostype=linux",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/ussch1northprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/ussch1westprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://switzerland.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  "ECSURI:https://mdav.ch.endpoint.security.microsoft.com/ecs",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_CH", l_0_12, 1)
local l_0_13 = {
  "SOAP:https://mdav.ina.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.ina.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.ina.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.ina.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.ina.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.ina.endpoint.security.microsoft.com/packages/",
  "DEFUPDATEMAC:https://mdav.ina.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.ina.endpoint.security.microsoft.com/packages/?ostype=linux",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/ussin1southprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/ussin1centralprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://india.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  "ECSURI:https://mdav.ina.endpoint.security.microsoft.com/ecs",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_IN", l_0_13, 1)
local l_0_14 = {
  "SOAP:https://mdav.aea.endpoint.security.microsoft.com/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.aea.endpoint.security.microsoft.com/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.aea.endpoint.security.microsoft.com/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.aea.endpoint.security.microsoft.com",
  "XPLATBROKER:https://mdav.aea.endpoint.security.microsoft.com/xplat/api/report",
  "DEFUPDATE:https://mdav.aea.endpoint.security.microsoft.com/packages",
  "DEFUPDATEMAC:https://mdav.aea.endpoint.security.microsoft.com/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.aea.endpoint.security.microsoft.com/packages/?ostype=linux",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/storage/ussaea1aec0aprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/storage/ussaea1aen0aprod/\",\"method\":\"GET\",\"response\":400},{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404},{\"uri\":\"https://nf.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400},{\"uri\":\"https://unitedarabemirates.smartscreen.microsoft.com/api/network/mac\",\"method\":\"POST\",\"response\":400}]}",
  "ECSURI:https://mdav.aea.endpoint.security.microsoft.com/ecs",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_AE", l_0_14, 1)
local l_0_15 = {
  "SOAP:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/mdav/wdcp.svc/bond/submitreport",
  "AGWURI:https://mdav.bla.endpoint.defender.svc.sovcloud.fr",
  "XPLATBROKER:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/xplat/api/report",
  "DEFUPDATE:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/packages",
  "DEFUPDATEMAC:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/packages/?ostype=linux",
  "ECSURI:https://mdav.bla.endpoint.defender.svc.sovcloud.fr/ecs",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_Bleu", l_0_15, 1)
local l_0_16 = {
  "SOAP:https://unitedstates1.cp.wd.microsoft.us/WdCpSrvc.asmx",
  "REST:https://unitedstates1.cp.wd.microsoft.us/wdcp.svc/submitReport",
  "BOND:https://unitedstates1.cp.wd.microsoft.us/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://unitedstates1.x.cp.wd.microsoft.us/api/report",
  "ECSURI:https://config.ecs.gov.teams.microsoft.us/",
  ""
}
local l_0_17 = false
if versioning.GetEngineBuild() >= 16700 then
  local l_0_18 = string.lower(versioning.GetOrgID())
  if l_0_18 == "baf4c18d-0c51-4329-9062-65c312537885" or l_0_18 == "d6ba914f-6a8f-47f9-9843-23913bb1a5a9" then
    local l_0_19 = {
      "SOAP:https://unitedstates4.cp.wd.microsoft.us/WdCpSrvc.asmx",
      "REST:https://unitedstates4.cp.wd.microsoft.us/wdcp.svc/submitReport",
      "BOND:https://unitedstates4.cp.wd.microsoft.us/wdcp.svc/bond/submitReport",
      "XPLATBROKER:https://unitedstates4.x.cp.wd.microsoft.us/api/report",
      "ECSURI:https://gccmod.ecs.office.com/",
      ""
    }
    database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_FFL4", l_0_19, 1)
    l_0_17 = true
  end
end
if l_0_17 == false then
  database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_FFL4", l_0_16, 1)
end
local l_0_20 = {
  "SOAP:https://mdav.usg.endpoint.security.microsoft.us/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.usg.endpoint.security.microsoft.us/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.usg.endpoint.security.microsoft.us/mdav/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://mdav.usg.endpoint.security.microsoft.us/xplat/api/report",
  "DEFUPDATE:https://mdav.usg.endpoint.security.microsoft.us/packages/",
  "DEFUPDATEMAC:https://mdav.usg.endpoint.security.microsoft.us/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.usg.endpoint.security.microsoft.us/packages/?ostype=linux",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_FFL4", l_0_20, 1)
local l_0_21 = {
  "SOAP:https://unitedstates4.cp.wd.microsoft.us/WdCpSrvc.asmx",
  "REST:https://unitedstates4.cp.wd.microsoft.us/wdcp.svc/submitReport",
  "BOND:https://unitedstates4.cp.wd.microsoft.us/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://unitedstates4.x.cp.wd.microsoft.us/api/report",
  "ECSURI:https://gccmod.ecs.office.com/",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_FFL4Mod", l_0_21, 1)
local l_0_22 = {
  "SOAP:https://mdav.usm.endpoint.security.microsoft.us/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.usm.endpoint.security.microsoft.us/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.usm.endpoint.security.microsoft.us/mdav/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://mdav.usm.endpoint.security.microsoft.us/xplat/api/report",
  "DEFUPDATE:https://mdav.usm.endpoint.security.microsoft.us/packages/",
  "DEFUPDATEMAC:https://mdav.usm.endpoint.security.microsoft.us/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.usm.endpoint.security.microsoft.us/packages/?ostype=linux",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_FFL4Mod", l_0_22, 1)
local l_0_23 = {
  "SOAP:https://unitedstates2.cp.wd.microsoft.us/WdCpSrvc.asmx",
  "REST:https://unitedstates2.cp.wd.microsoft.us/wdcp.svc/submitReport",
  "BOND:https://unitedstates2.cp.wd.microsoft.us/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://unitedstates2.x.cp.wd.microsoft.us/api/report",
  "ECSURI:https://config.ecs.dod.teams.microsoft.us/",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_FFL5", l_0_23, 1)
local l_0_24 = {
  "SOAP:https://mdav.usd.endpoint.security.microsoft.us/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.usd.endpoint.security.microsoft.us/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.usd.endpoint.security.microsoft.us/mdav/wdcp.svc/bond/submitReport",
  "XPLATBROKER:https://mdav.usd.endpoint.security.microsoft.us/xplat/api/report",
  "DEFUPDATE:https://mdav.usd.endpoint.security.microsoft.us/packages/",
  "DEFUPDATEMAC:https://mdav.usd.endpoint.security.microsoft.us/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.usd.endpoint.security.microsoft.us/packages/?ostype=linux",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_FFL5", l_0_24, 1)
local l_0_25 = {
  "SOAP:https://mdav.uss.endpoint.security.microsoft.scloud/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.uss.endpoint.security.microsoft.scloud/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.uss.endpoint.security.microsoft.scloud/mdav/wdcp.svc/bond/submitReport",
  "AGWURI:https://mdav.uss.endpoint.security.microsoft.scloud",
  "XPLATBROKER:https://mdav.uss.endpoint.security.microsoft.scloud/xplat/api/report",
  "DEFUPDATE:https://mdav.uss.endpoint.security.microsoft.scloud/packages/",
  "DEFUPDATEMAC:https://mdav.uss.endpoint.security.microsoft.scloud/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.uss.endpoint.security.microsoft.scloud/packages/?ostype=linux",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404}]}",
  "ECSURI:https://config.ecs.teams.microsoft.scloud/",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_USSec", l_0_25, 1)
local l_0_26 = {
  "SOAP:https://mdav.usn.endpoint.security.eaglex.ic.gov/mdav/WdCpSrvc.asmx",
  "REST:https://mdav.usn.endpoint.security.eaglex.ic.gov/mdav/wdcp.svc/submitReport",
  "BOND:https://mdav.usn.endpoint.security.eaglex.ic.gov/mdav/wdcp.svc/bond/submitReport",
  "AGWURI:https://mdav.usn.endpoint.security.eaglex.ic.gov",
  "XPLATBROKER:https://mdav.usn.endpoint.security.eaglex.ic.gov/xplat/api/report",
  "DEFUPDATE:https://mdav.usn.endpoint.security.eaglex.ic.gov/packages/",
  "DEFUPDATEMAC:https://mdav.usn.endpoint.security.eaglex.ic.gov/packages/?ostype=mac",
  "DEFUPDATELIN:https://mdav.usn.endpoint.security.eaglex.ic.gov/packages/?ostype=linux",
  "XPLATTEST:{\"macTest\":[{\"api\":\"/packages/?ostype=mac\",\"method\":\"HEAD\",\"response\":200}],\"linuxTest\":[{\"api\":\"/packages/?ostype=linux\",\"method\":\"HEAD\",\"response\":200}],\"xplatTest\":[{\"api\":\"/xplat/api/report\",\"method\":\"GET\",\"response\":200,\"verifySsl\":{}},{\"api\":\"/mdav/test\",\"method\":\"GET\",\"response\":404}]}",
  "ECSURI:https://config.ecs.teams.eaglex.ic.gov/",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "MAPSURL_GW_USNat", l_0_26, 1)
