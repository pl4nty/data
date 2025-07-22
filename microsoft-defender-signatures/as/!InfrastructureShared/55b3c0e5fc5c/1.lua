-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b3c0e5fc5c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[2]).utf8p1)
local l_0_2 = (MpCommon.PathToWin32Path)((this_sigattrlog[3]).utf8p1)
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2, "Fsize:(%d+)")
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
else
  l_0_3 = tonumber(l_0_3)
end
do
  local l_0_4 = GetRollingQueueKeyValue(l_0_0, l_0_1)
  if isnull(l_0_4) then
    return mp.CLEAN
  end
  for l_0_8 in (string.gmatch)(l_0_4, "([^,]+)") do
    local l_0_9, l_0_10 = (string.match)(l_0_8, "^(.-)_(%d+)$")
    if not isnull(l_0_9) and not isnull(l_0_10) and l_0_3 == tonumber(l_0_10) then
      local l_0_11, l_0_12 = (bm.get_process_relationships)()
      if l_0_12 then
        for l_0_16,l_0_17 in pairs(l_0_12) do
          if l_0_17.ppid and l_0_17.image_path and (string.lower)(l_0_17.image_path) == (string.lower)(l_0_2) then
            local l_0_18 = bm.add_related_string
            local l_0_19 = l_0_0
            local l_0_20 = safeJsonSerialize
            local l_0_21 = {}
            l_0_21.RQ = l_0_4 or ""
            l_0_21.SectionName = l_0_9
            l_0_21.SectionSize = l_0_10
            l_0_21.SecondProc = l_0_17.ppid
            l_0_21.FirstP1 = (this_sigattrlog[2]).utf8p1 or ""
            l_0_21.FirstP2 = (this_sigattrlog[2]).utf8p2 or ""
            l_0_21.FirstPath = l_0_1
            l_0_21.SecondP1 = (this_sigattrlog[3]).utf8p1 or ""
            l_0_21.SecondP2 = (this_sigattrlog[3]).utf8p2 or ""
            l_0_21.SecondSize = l_0_3
            l_0_20 = l_0_20(l_0_21)
            l_0_21 = bm
            l_0_21 = l_0_21.RelatedStringBMReport
            l_0_18(l_0_19, l_0_20, l_0_21)
            l_0_18 = mp
            l_0_18 = l_0_18.INFECTED
            return l_0_18
          end
        end
      end
      do
        local l_0_23 = nil
        local l_0_24 = bm.add_related_string
        local l_0_25 = l_0_0
        local l_0_26 = safeJsonSerialize
        do
          l_0_26 = l_0_26({RQ = l_0_4 or "", SectionName = l_0_9, SectionSize = l_0_10, SecondProc = "not found", FirstP1 = (this_sigattrlog[2]).utf8p1 or "", FirstP2 = (this_sigattrlog[2]).utf8p2 or "", FirstPath = l_0_1, SecondP1 = (this_sigattrlog[3]).utf8p1 or "", SecondP2 = (this_sigattrlog[3]).utf8p2 or "", SecondSize = l_0_3})
          l_0_24(l_0_25, l_0_26, bm.RelatedStringBMReport)
          l_0_24 = mp
          l_0_24 = l_0_24.INFECTED
          do return l_0_24 end
          -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC225: freeLocal<0 in 'ReleaseLocals'

end

