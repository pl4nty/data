-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/SystemPamRewrite.A
-- Type: 35
-- MpAttributes: BM_ELF_DYN_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or #l_0_1 < 20 then
  return mp.CLEAN
end
if string.match(l_0_1, "/lib/.+/security/pam_unix2?%.so$") then
  return mp.INFECTED
end
return mp.CLEAN
