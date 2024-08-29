package body Kernel is
   procedure Printk_C (S : String) with
      Import        => True,
      Convention    => C,
      External_Name => "printk";

   procedure Printk (S : String) is
   begin
      Printk_C (S & Ascii.Lf & Ascii.Nul);
   end;
end Kernel;
