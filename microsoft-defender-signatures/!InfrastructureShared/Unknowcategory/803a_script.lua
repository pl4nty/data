-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\803a_luac 

-- params : ...
-- function num : 0
if peattributes.amd64_image and (pesecs[pehdr.NumberOfSections - 1]).Characteristics == 3221225472 then
  return mp.INFECTED
end
return mp.CLEAN

