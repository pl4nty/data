-- Threat: !InfrastructureShared
-- Name: 1408f60ed700e
-- Type: 21

if mp.get_mpattribute("BM_OLE_FILE") and (mp.get_mpattribute("MHSTR:MacroExecute") or mp.get_mpattribute("MHSTR:MacroJustAutoOpen")) then
  return mp.INFECTED
end
return mp.CLEAN
