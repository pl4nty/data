-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1cdd7061f2fad\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.hstr_full_log)()
do
  if not (l_0_0.br_msedge).matched and not (l_0_0.br_chrome).matched and not (l_0_0.br_brave).matched and not (l_0_0.br_opera).matched then
    local l_0_1, l_0_2 = (l_0_0.br_vivaldi).matched
  end
  local l_0_3 = nil
  if not l_0_3 and not (l_0_0.br_firefox).matched then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

  if (not l_0_3 or not (l_0_0.flag_single).matched) and (not (l_0_0.br_firefox).matched or not (l_0_0.flag_osint).matched) then
    return mp.CLEAN
  end
  do
    if not (l_0_0.dom_perplexity).matched and not (l_0_0.dom_chatgpt).matched and not (l_0_0.dom_openai).matched and not (l_0_0.dom_copilot).matched and not (l_0_0.dom_claude).matched and not (l_0_0.dom_grok).matched then
      local l_0_4 = nil
    end
    if not (l_0_0.dom_deepseek).matched then
      return mp.CLEAN
    end
    if not (l_0_0.q_qmark).matched and not (l_0_0.qenc_qmark).matched then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if (mp.GetParentProcInfo)() == nil then
      return mp.CLEAN
    end
    if ((mp.GetParentProcInfo)()).image_path == nil then
      return mp.CLEAN
    end
    local l_0_6 = nil
    if ((string.lower)(((mp.GetParentProcInfo)()).image_path)):match("([^\\]+)$") == nil then
      return mp.CLEAN
    end
    local l_0_7 = nil
    -- DECOMPILER ERROR at PC133: Confused about usage of register: R5 in 'UnsetPending'

    if not ({["winword.exe"] = true, ["excel.exe"] = true, ["powerpnt.exe"] = true, ["outlook.exe"] = true, ["olk.exe"] = true, ["onenote.exe"] = true, ["mspub.exe"] = true, ["visio.exe"] = true, ["ms-teams.exe"] = true, ["teams.exe"] = true, ["slack.exe"] = true, ["discord.exe"] = true, ["zoom.exe"] = true, ["thunderbird.exe"] = true, ["acrord32.exe"] = true, ["acrobat.exe"] = true, ["foxitpdfreader.exe"] = true, ["sumatrapdf.exe"] = true})[((string.lower)(((mp.GetParentProcInfo)()).image_path)):match("([^\\]+)$")] then
      return mp.CLEAN
    end
    ExtractCmdLinePayload()
    return mp.INFECTED
  end
end

