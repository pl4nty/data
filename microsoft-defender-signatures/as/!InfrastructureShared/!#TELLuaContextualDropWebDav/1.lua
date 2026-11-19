-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:ContextualDropWebDav
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("\\TfsStore\\Tfs_DAV", 1, true) ~= nil then
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_3 == "svchost.exe" then
      local l_0_4 = MpCommon.QueryPersistContext(l_0_2, "DroppedFromWebDav")
      if not l_0_4 then
        MpCommon.AppendPersistContext(l_0_2, "DroppedFromWebDav", 0)
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
