-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!MalagentSC\Includes\1.luac 

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
if not StringEndsWith(l_0_0, ":\\perflogs") and not StringEndsWith(l_0_0, ":\\users\\public\\music") and not StringEndsWith(l_0_0, ":\\users\\public") then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["chrome.exe"] = true
l_0_2["explorer.exe"] = true
l_0_2["swchost.exe"] = true
l_0_2["svchost.exe"] = true
l_0_2["svvhost.exe"] = true
l_0_2["svchost.dll"] = true
local l_0_3 = false
if l_0_2[l_0_1] then
  l_0_3 = true
end
if not l_0_3 then
  local l_0_4 = contains
  local l_0_5 = l_0_1
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC101: No list found for R6 , SetList fails

end
do
  do
    -- DECOMPILER ERROR at PC108: Overwrote pending register: R4 in 'AssignReg'

    if not l_0_4 or l_0_3 then
      if (l_0_4.IsTrustedFile)(false) == true then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

