-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\RansomWin32TroldeshD\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("TELPER:KPAT:VirTool:Win32/ObfuscatorGd!decblob") then
  if (string.len)((mp.getfilename)()) < 8 then
    return mp.CLEAN
  end
  local l_0_0 = (string.lower)((mp.getfilename)())
  if (string.find)(l_0_0, "csrss.exe%->%(nsis") ~= nil then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

