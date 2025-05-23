-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!MalagentSA\Includes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if not contains(l_0_0, (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["svhost.dll"] = true
l_0_2["svhost.exe"] = true
l_0_2["x64win.exe"] = true
l_0_2["x64win.dll"] = true
l_0_2["x32win.dll"] = true
l_0_2["x32win.exe"] = true
l_0_2["dlihost.exe"] = true
if l_0_2[l_0_1] then
  if (mp.IsTrustedFile)(false) == true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

