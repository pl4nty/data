-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000014f3_luac 

-- params : ...
-- function num : 0
SetAttributeFromClassifierScoresEx = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  for l_1_6,l_1_7 in ipairs(l_1_1) do
    if l_1_7 <= l_1_0 then
      (mp.set_mpattribute)(l_1_2 .. l_1_7)
      break
    end
  end
end


