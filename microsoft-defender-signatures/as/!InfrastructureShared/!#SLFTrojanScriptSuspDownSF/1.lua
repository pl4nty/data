-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanScriptSuspDownSF\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_3 and l_0_4 ~= nil and (string.find)(l_0_4, "\\powershell.exe", 1, true) then
      local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if not l_0_5 then
        return mp.CLEAN
      end
      local l_0_6 = (mp.getfilesize)()
      if l_0_6 > 450 then
        return mp.CLEAN
      end
      local l_0_7 = (mp.GetProcessCommandLine)(l_0_5)
      if not l_0_7 then
        return mp.CLEAN
      end
      l_0_7 = (string.lower)(l_0_7)
      if #l_0_7 < 50 then
        return mp.CLEAN
      end
      if #l_0_7 > 450 then
        return mp.CLEAN
      end
      local l_0_8, l_0_9 = extract_urls(l_0_7)
      if isnull(l_0_9) then
        return mp.CLEAN
      end
      for l_0_13,l_0_14 in ipairs(l_0_9) do
        local l_0_15 = split(l_0_14, "%.")
        if not l_0_15 then
          return mp.CLEAN
        end
        local l_0_16 = "." .. tostring(l_0_15[#l_0_15])
        if not l_0_16 then
          return mp.CLEAN
        end
        if isSuspTLD(l_0_16) then
          local l_0_17 = (mp.GetParentProcInfo)(l_0_5)
          if l_0_17 ~= nil and l_0_17.image_path ~= nil then
            local l_0_18 = (string.lower)(l_0_17.image_path)
            local l_0_19 = l_0_18:match("([^\\]+)$")
            local l_0_20 = {}
            l_0_20["explorer.exe"] = true
            l_0_20["powershell.exe"] = true
            l_0_20["cmd.exe"] = true
            if l_0_20[l_0_19] then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
do
  l_0_1 = mp
  l_0_1 = l_0_1.CLEAN
  return l_0_1
end

