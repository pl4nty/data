-- Threat: !InfrastructureShared
-- Name: 5ad73a1d20ec
-- Type: 21
-- Includes: TechniqueTracker

if hstrlog[2].matched and hstrlog[3].matched then
  if hstrlog[4].matched or hstrlog[5].matched then
    return mp.INFECTED
  end
  if IsDetectionThresholdMet("CMDHSTR") then
    return mp.INFECTED
  end
end
return mp.CLEAN
