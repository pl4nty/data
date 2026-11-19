-- Threat: !InfrastructureShared
-- Name: !#CheckForVatet
-- Type: 13
-- MpAttributes: Lua:NewWrittenBySystemProcess & (!Lua:RemoteCopyExclusions)

local l_0_0 = {
  ["c:\\windows\\inf"] = "inf",
  ["c:\\windows\\help"] = "help",
  ["c:\\windows\\debug"] = "debug",
  ["c:\\windows\\media"] = "media"
}
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH):lower()
if l_0_1 ~= nil and 8 < #l_0_1 then
  if l_0_1:sub(1, 8) == "\\device\\" then
    l_0_1 = MpCommon.PathToWin32Path(l_0_1):lower()
  end
  local l_0_2 = l_0_0[l_0_1]
  if l_0_0[l_0_1] ~= nil then
    local l_0_3 = "FileDropBySuspectedVatet_"
    local l_0_4 = "Lua:Context/SuspectedVatet!"
    local l_0_5 = l_0_3 .. l_0_2
    local l_0_6 = l_0_4 .. l_0_2
    local l_0_7 = MpCommon.QueryPersistContext(l_0_1, l_0_5)
    if not l_0_7 then
      MpCommon.AppendPersistContext(l_0_1, l_0_5, 1000)
    end
    mp.set_mpattribute(l_0_6)
    return mp.INFECTED
  end
end
return mp.CLEAN
