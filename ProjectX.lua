while task.wait() do
  game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RF.RequestStartFight:InvokeServer()
  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
end
