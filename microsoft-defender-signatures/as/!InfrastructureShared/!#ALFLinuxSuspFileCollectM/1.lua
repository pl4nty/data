-- Threat: !InfrastructureShared
-- Name: !#ALF:Linux/SuspFileCollect.M
-- Type: 13
-- MpAttributes: (BM_ELF_FILE | Lua:SHExt | BM_SH_FILE)

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" and l_0_0:lower() ~= "73a99e52-c380-4b86-9d47-fe1cb231f222" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_2 ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
