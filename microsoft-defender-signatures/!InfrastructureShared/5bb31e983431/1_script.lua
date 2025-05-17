-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb31e983431\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
local l_0_2 = ""
if (this_sigattrlog[1]).matched then
  l_0_1 = (this_sigattrlog[1]).utf8p1
  if l_0_1 ~= nil then
    l_0_0 = l_0_1:match("(.+[//])")
    l_0_2 = l_0_1
  end
else
  if (this_sigattrlog[2]).matched then
    local l_0_3 = (bm.get_current_process_startup_info)()
    local l_0_4 = l_0_3.command_line
    if l_0_4 then
      local l_0_5 = (mp.GetExecutablesFromCommandLine)(l_0_4)
      if l_0_5 == nil then
        return mp.CLEAN
      end
      for l_0_9,l_0_10 in ipairs(l_0_5) do
        if l_0_10 ~= nil and (sysio.IsFileExists)(l_0_10) and (string.sub)(l_0_10, 1, 5) == "/mnt/" then
          l_0_0 = l_0_10:match("(.+[//])")
          l_0_2 = l_0_10
        end
      end
    end
  end
end
do
  if l_0_0 == nil or l_0_0 == "" or l_0_2 == nil or l_0_2 == "" then
    l_0_3 = mp
    l_0_3 = l_0_3.CLEAN
    return l_0_3
  end
  l_0_3 = taint
  l_0_4 = l_0_2
  l_0_5 = "mounted_file_execution"
  l_0_3(l_0_4, l_0_5, 3600)
  l_0_3 = "queue_remotedir_mount"
  local l_0_11 = nil
  l_0_4 = "dir_name"
  local l_0_12 = nil
  l_0_5 = sysio
  l_0_5 = l_0_5.IsFolderExists
  l_0_11 = l_0_0
  l_0_5 = l_0_5(l_0_11)
  if l_0_5 then
    l_0_5 = GetRollingQueueKeyValues
    l_0_11 = l_0_3
    l_0_12 = l_0_4
    l_0_5 = l_0_5(l_0_11, l_0_12)
    local l_0_13 = nil
    if l_0_5 then
      l_0_11 = ipairs
      l_0_12 = l_0_5
      l_0_11 = l_0_11(l_0_12)
      for l_0_17,l_0_18 in l_0_11 do
        local l_0_16, l_0_17, l_0_18 = nil
        if l_0_15 then
          l_0_16 = string
          l_0_16 = l_0_16.sub
          l_0_17 = l_0_0
          l_0_18 = 1
          l_0_16 = l_0_16(l_0_17, l_0_18, (string.len)(l_0_15.value))
          l_0_17 = l_0_15.value
          if l_0_16 == l_0_17 then
            l_0_16 = taint
            l_0_17 = l_0_2
            l_0_18 = "remote_file_created_taint"
            l_0_16(l_0_17, l_0_18, 3600)
            l_0_16 = bm
            l_0_16 = l_0_16.trigger_sig
            l_0_17 = "RemoteFileCopy"
            l_0_18 = l_0_2
            l_0_16(l_0_17, l_0_18)
            l_0_16 = this_sigattrlog
            l_0_16 = l_0_16[1]
            l_0_16 = l_0_16.matched
            if l_0_16 then
              l_0_16 = bm
              l_0_16 = l_0_16.trigger_sig
              l_0_17 = "Behavior:Linux/RemoteFileExecution.AL"
              l_0_18 = l_0_2
              l_0_16(l_0_17, l_0_18)
            else
              l_0_16 = this_sigattrlog
              l_0_16 = l_0_16[2]
              l_0_16 = l_0_16.matched
              if l_0_16 then
                l_0_16 = bm
                l_0_16 = l_0_16.trigger_sig
                l_0_17 = "Behavior:Linux/RemoteMountedScriptExecution.AL"
                l_0_18 = l_0_2
                l_0_16(l_0_17, l_0_18)
              end
            end
            l_0_16 = addRelatedProcess
            l_0_16()
            l_0_16 = reportRelatedBmHits
            l_0_16()
            l_0_16 = TrackPidAndTechniqueBM
            l_0_17 = "BM"
            l_0_18 = "T1080"
            l_0_16(l_0_17, l_0_18, "LateralMovement_TaintSharedContent_RemoteMountedFileExecution")
            l_0_16 = mp
            l_0_16 = l_0_16.INFECTED
            return l_0_16
          end
        end
      end
    end
  end
  do
    l_0_5 = mp
    l_0_5 = l_0_5.CLEAN
    do return l_0_5 end
    -- DECOMPILER ERROR at PC162: Confused about usage of register R8 for local variables in 'ReleaseLocals'

  end
end

