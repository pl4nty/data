-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\828c_293.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and (mp.getfilesize)() <= 150000 and (mp.get_mpattribute)("Sigattr:Win32/ShellcodeRunner.AL!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

