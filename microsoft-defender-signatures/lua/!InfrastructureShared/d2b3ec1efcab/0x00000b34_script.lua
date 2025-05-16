-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d2b3ec1efcab\0x00000b34_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 then
  local l_0_2 = (string.match)(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+))")
  if l_0_2 then
    local l_0_3 = "queue_remotedir_mount"
    local l_0_4 = "dir_name"
    local l_0_5 = StringSplit(l_0_1, " ")
    if l_0_5 == nil or #l_0_5 < 4 then
      return mp.CLEAN
    end
    for l_0_9,l_0_10 in ipairs(l_0_5) do
      if l_0_9 > 1 and l_0_10 ~= nil and (sysio.IsFolderExists)(l_0_10) then
        if not IsKeyValuePairInRollingQueue(l_0_3, l_0_4, l_0_10) then
          AppendToRollingQueue(l_0_3, l_0_4, l_0_10, 3600)
        end
        addRelatedProcess()
        reportRelatedBmHits()
        TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_SuspiciousMount")
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_2 = mp
  l_0_2 = l_0_2.CLEAN
  return l_0_2
end

