-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7509_261.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.hasexports == true and (mp.get_mpattribute)("MpNewlyCreatedHint") == true then
  return mp.INFECTED
end
return mp.CLEAN

