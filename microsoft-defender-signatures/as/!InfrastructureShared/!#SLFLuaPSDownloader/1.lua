local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L1_1 = L1_1(L2_1)
  if L1_1 == true then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
    L2_1 = "amazon-ssm-agent.exe|waworkerhost.exe|gcemetadatascripts.exe|ruby.exe|ssm-document-worker.exe|glyph.publisher.exe|ssm-agent-worker.exe|screenconnect.clientservice.exe|cfn-init.exe|winhup.exe|cloudtestagent.exe|microsoft.management.services.intunewindowsagent.exe|azcopy.exe|agentexecutor.exe|gitlab-runner.exe|scriptrunner.exe|cagservice.exe|ltsvc.exe|jumpcloud-agent-updater.exe|"
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = L1_1
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = "cyserver.exe|aemagent.exe|pangphip.exe|repmgr.exe|taniumcx.exe"
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = L1_1
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.getfilename
    L5_1 = mp
    L5_1 = L5_1.bitor
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_FNAME
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
    L5_1 = "appveyor.yml|cscompmeta|resume_db.json|metadata_db.json|userscript.bat|userscript.ps1|"
    L7_1 = L5_1
    L6_1 = L5_1.find
    L8_1 = L4_1
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = TrackPidAndTechnique
    L7_1 = "AMSI"
    L8_1 = "T1105"
    L9_1 = "ingress_tool"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
