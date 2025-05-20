-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8773_307.luac 

-- params : ...
-- function num : 0
if epcode[1] == 139 and epcode[2] == 255 and peattributes.isdll == true and peattributes.hasexports == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

