with Kernel; use Kernel;

package body Module is

   procedure Ada_Init_Module is
   begin
      Printk ("Hello Kernel!");
   end;

   procedure Ada_Cleanup_Module is
   begin
      null;
   end;
end Module;
