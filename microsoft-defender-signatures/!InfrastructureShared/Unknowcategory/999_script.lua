-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\999_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return false
end
local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
local l_0_2 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
do
  do
    if not (string.find)(l_0_1, "\\program files\\7-zip", 1, true) ~= nil or (string.find)(l_0_1, "\\program files (x86)\\7-zip", 1, true) ~= nil or ((string.sub)(l_0_2, 1, 2) == "7z" and l_0_2 ~= "7z.exe" and l_0_2 ~= "7za.exe" and l_0_2 ~= "7zfm.exe" and l_0_2 ~= "7zg.exe" and (string.find)(l_0_2, "7z%d%d%d%d%-x64%.exe") == nil and (string.find)(l_0_2, "7z%d%d%d%d%.exe") ~= nil) or not (string.find)(l_0_1, "\\program files\\winrar", 1, true) ~= nil or (string.find)(l_0_1, "\\program files (x86)\\winrar", 1, true) ~= nil or l_0_2 == "rar.exe" or l_0_2 == "unrar.exe" or l_0_2 == "winrar.exe" then
      local l_0_11 = nil
      if (mp.IsKnownFriendlyFile)((MpCommon.PathToWin32Path)(l_0_1 .. "\\" .. l_0_2), true, true) then
        return true
      end
    end
    do return false end
    -- DECOMPILER ERROR at PC134: freeLocal<0 in 'ReleaseLocals'

    -- DECOMPILER ERROR: 9 unprocessed JMP targets
  end
end

