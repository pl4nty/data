-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3722f7afa\1.luac 

-- params : ...
-- function num : 0
if isnull(this_sigattrlog[1]) or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
;
(bm.add_related_string)("MaliciousSerializedObjectInfo", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
local l_0_0 = (string.match)((this_sigattrlog[1]).utf8p2, "Path=(.-);Chain=")
if not isnull(l_0_0) then
  local l_0_1 = GetRollingQueueKeyValue("MaliciousSerializedObject", l_0_0)
  if isnull(l_0_1) then
    local l_0_2 = bm.add_related_string
    local l_0_3 = "MaliciousSerializedObjectFull"
    local l_0_4 = string.format
    local l_0_5 = "Error finding %s"
    l_0_4 = l_0_4(l_0_5, l_0_0 or "[missing path]")
    l_0_5 = bm
    l_0_5 = l_0_5.RelatedStringBMReport
    l_0_2(l_0_3, l_0_4, l_0_5)
  else
    do
      do
        -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (bm.add_related_string)("MaliciousSerializedObjectFull", l_0_1, bm.RelatedStringBMReport)
        do return mp.INFECTED end
        -- DECOMPILER ERROR at PC70: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

