-- Threat: !InfrastructureShared
-- Name: !#LUA:XFTokenInside
-- Type: 13
-- MpAttributes: MpExcelFormulaRoutines

if mp.get_mpattributesubstring("MHSTR:XL4:Expert:Feature") then
  return mp.INFECTED
end
return mp.CLEAN
