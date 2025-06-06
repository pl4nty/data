-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b399011d61\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = (this_sigattrlog[1]).utf8p2
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  ;
  (bm.add_related_string)("SmsScanDetection", l_0_1, bm.RelatedStringBMReport)
  return mp.INFECTED
end

