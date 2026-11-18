-- Threat: !InfrastructureShared
-- Name: !#LUA:DroppedExeWithNoCertInStartUpFolder.A
-- Type: 9
-- MpAttributes: RPF:TopLevelFile & pea_isexe & !pea_isdamaged & !PEPCODE:HasDigitalSignature

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0:find("\\start menu\\programs\\startup", 1, true) then
    local l_0_2 = {
      [".com"] = true,
      [".exe"] = true,
      [".pif"] = true
    }
    local l_0_3 = l_0_1:sub(-4)
    if l_0_1 ~= nil and l_0_2[l_0_3] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
