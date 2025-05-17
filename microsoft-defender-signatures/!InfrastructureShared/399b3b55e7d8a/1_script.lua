-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\399b3b55e7d8a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = GetAppomalyProcessAttribute(l_0_0.ppid)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3.isThreat = false
if (this_sigattrlog[4]).matched then
  l_0_3.alert = (this_sigattrlog[4]).utf8p1
  l_0_3.type = "SIGTRIGGER"
else
  if (this_sigattrlog[5]).matched then
    l_0_3.alert = (this_sigattrlog[5]).utf8p1
    l_0_3.type = "SIGTRIGGER"
    l_0_3.isThreat = true
  else
    if (this_sigattrlog[6]).matched then
      l_0_3.alert = (this_sigattrlog[6]).utf8p2
      l_0_3.type = "SIGTRIGGER"
    else
      if (this_sigattrlog[7]).matched then
        l_0_3.alert = (this_sigattrlog[7]).utf8p2
        l_0_3.isThreat = true
        l_0_3.type = "SIGTRIGGER"
      else
        if (this_sigattrlog[8]).matched then
          l_0_3.alert = (this_sigattrlog[8]).utf8p2
          l_0_3.isThreat = true
          l_0_3.type = "SIGTRIGGER"
        else
          if (this_sigattrlog[9]).matched then
            l_0_3.alert = (this_sigattrlog[9]).utf8p1
            l_0_3.type = "SIGTRIGGER"
          else
            if (this_sigattrlog[10]).matched then
              l_0_3.alert = (this_sigattrlog[10]).utf8p1
              l_0_3.isThreat = true
              l_0_3.type = "SIGTRIGGER"
            else
              if (this_sigattrlog[11]).matched then
                l_0_3.alert = (this_sigattrlog[11]).utf8p1
                l_0_3.type = "Exclusion"
              else
                if (this_sigattrlog[12]).matched then
                  l_0_3.alert = (this_sigattrlog[12]).utf8p1
                  l_0_3.type = "Exclusion"
                else
                  if (this_sigattrlog[13]).matched then
                    l_0_3.alert = (this_sigattrlog[13]).utf8p1
                    l_0_3.type = "Tampering"
                  else
                    if (this_sigattrlog[14]).matched then
                      l_0_3.alert = (this_sigattrlog[14]).utf8p1
                      l_0_3.type = "Tampering"
                    else
                      if (this_sigattrlog[15]).matched then
                        l_0_3.alert = (this_sigattrlog[15]).utf8p1
                        l_0_3.type = "Tampering"
                        l_0_3.isThreat = true
                      else
                        if (this_sigattrlog[16]).matched then
                          l_0_3.alert = (this_sigattrlog[16]).utf8p1
                          l_0_3.type = "Tampering"
                          l_0_3.isThreat = true
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if not l_0_3.alert then
  return mp.CLEAN
end
l_0_3.score = AlertGrading(l_0_3, l_0_0.ppid)
local l_0_4 = "[" .. l_0_3.type .. "][" .. (l_0_0.ppid):match("pid:(%d+)") .. "][" .. l_0_3.alert .. "]"
local l_0_5 = IncreaseProcessAnomalyScore
local l_0_6 = l_0_0.ppid
local l_0_7 = l_0_3.score
local l_0_8 = l_0_4
local l_0_9 = l_0_1
local l_0_10 = {}
l_0_10.isThreat = l_0_3.isThreat
l_0_5 = l_0_5(l_0_6, l_0_7, l_0_8, l_0_9, l_0_10)
if not l_0_5 then
  l_0_8 = bm
  l_0_8 = l_0_8.get_imagepath
  l_0_8 = l_0_8()
  l_0_8 = safeJsonSerialize
  l_0_9, l_0_7 = l_0_7, {SignatureName = "BM/PFATamper.D", ProcessName = l_0_8, err = l_0_6, AttributeValue = l_0_2}
  l_0_8 = l_0_8(l_0_9)
  l_0_9 = bm
  l_0_9 = l_0_9.trigger_sig
  l_0_10 = "ProcAttribError"
  l_0_9(l_0_10, l_0_8)
  l_0_9 = bm
  l_0_9 = l_0_9.add_related_string
  l_0_10 = "Error"
  l_0_9(l_0_10, l_0_8, bm.RelatedStringBMReport)
else
  l_0_2 = 
end
l_0_3.ProcessAttribute = l_0_2
l_0_7 = bm
l_0_7 = l_0_7.add_related_string
l_0_8 = "Event"
l_0_9 = safeJsonSerialize
l_0_10 = l_0_3
l_0_9 = l_0_9(l_0_10)
l_0_10 = bm
l_0_10 = l_0_10.RelatedStringBMReport
l_0_7(l_0_8, l_0_9, l_0_10)
l_0_7 = mp
l_0_7 = l_0_7.INFECTED
return l_0_7

