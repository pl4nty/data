-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7702_266.luac 

-- params : ...
-- function num : 0
do
  local l_0_0 = (string.lower)(tostring(headerpage))
  if l_0_0 > 5 then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

