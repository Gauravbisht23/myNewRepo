public class otherQueueableMethod implements Queueable {

    public static void execute(Queueablecontext context){
        system.debug('Second queueable class called from first');
    }
}