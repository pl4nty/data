-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\874d_305.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.hasexports == true and (pesecs[4]).Name == ".debug" and (pesecs[4]).Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN

