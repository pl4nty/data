-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8d78ba3f4b7a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if not isnull(l_0_1) and l_0_1 > 2000000 then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS ~= l_0_0 then
  if peattributes.isexe then
    return mp.CLEAN
  end
  local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if not isnull(l_0_2) then
    if (mp.IsKnownFriendlyFile)(l_0_2, true, false) then
      return mp.CLEAN
    end
    local l_0_3 = (string.lower)(l_0_2)
    if (string.find)(l_0_3, "amsistream-", 1, true) then
      return mp.CLEAN
    end
  end
  do
    do
      if checkIfCertificateHit() then
        return mp.CLEAN
      end
      if mp.HSTR_CALLER_SMS == l_0_0 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

