public class MultiselectController {

    public MultiselectController(ApexPages.StandardController controller) {
value = new String[] { '1', '2' };
        options  = new List<SelectOption> {
            new SelectOption('1', '1'),
            new SelectOption('2', '2'),
            new SelectOption('3', '3'),
            new SelectOption('4', '4'),
            new SelectOption('5', '5')   }; 
    }

    public List<SelectOption> options { get; set; }
    public String[] value { get; set; }
    
    
}