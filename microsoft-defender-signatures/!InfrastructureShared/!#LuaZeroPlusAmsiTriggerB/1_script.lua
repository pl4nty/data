-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaZeroPlusAmsiTriggerB\1_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("SLF:") then
  if (mp.get_mpattributesubstring)("!ams") and (mp.get_mpattributesubstring)("SLF:TTCTX:") then
    return mp.INFECTED
  end
  if (mp.get_mpattributesubstring)(":PS/") or (mp.get_mpattributesubstring)(":PowerShell/") then
    return mp.INFECTED
  end
end
return mp.CLEAN

