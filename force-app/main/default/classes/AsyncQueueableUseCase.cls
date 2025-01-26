public class AsyncQueueableUseCase implements Queueable {

    public static void execute(QueueableContext context){
        system.debug('First Queueable Class');
        system.enqueueJob(new otherQueueableMethod());
    }
}