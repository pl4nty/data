-- Threat: !InfrastructureShared
-- Name: !#SLF:NewMSDiagCabCfgPresent.A
-- Type: 13
-- MpAttributes: BM_XML_FILE & SCPT:DiagPkgRef.A & SCPT:DiagCplRef.A & (!RPF:TopLevelFile)

if mp.get_mpattribute("//Lua:NewDiagCabFile") then
  local l_0_0 = mp.getfilename()
  if l_0_0 ~= nil and l_0_0:lower():match("%.diagcab%-%>.+%.diagcfg$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
